###  Resources
* Source code for this episode: https://github.com/brightoctopus/rails-mvc-intro/tree/0eb5eb42359b0d923c09bb147a13d392295b8980
* Github repo for Ruby on Rails: https://github.com/rails/rails
* Ruby on Rails Routing: https://blog.brightoctopus.dev/rails-5-routing-recipes/

### Lecture notes

Ruby on Rails follows the Model-View-Controller design pattern and it implements Models for handling the data layer, Controllers that are responsible for fetching and sending data to the models and rendering Views.

To start a new application, open the terminal and run 

```bash
rails new name-of-your-app
```

This will generate a new Rails application with default configurations. 

Run `rails s` in the folder of your application to start a server and then you can open `localhost:3000` in the browser and see the Rails welcome screen. This means the app was successfully generated.

We start with the data layer - the **Model**. Rails provides some handy generators that we can use in the terminal. To create a new model, we can use the model generator:

```bash
rails generate model Artist name:string
````

or 

```bash
rails g model Artist name
````

By convention, model names are singular and the default column type is _string_, which why we can omit it when we use the generator. This will create several files, including the file for the Artist model and the respective migration. Migrations contain instructions to change the structure of our Database and to apply a migration, we run in the terminal:

```bash
rails db:migrate
```

Now with the model and the respective database table created, we can move on to the Controller. For a given HTTP request, we can a controller action to be executed. Controller actions are methods implemented in a controller. The way Rails maps requests to specific controller actions is through the router. We will need two routes: one to display all the artists, the **index**, and another to display a specific page of an artist, the **show*.

```ruby
# config/routes.rb

Rails.application.routes.draw do
  resources :artists, only: %i[index show]
end
```

To check the routes generated, we can run `rails routes -c artists` in the terminal.

Now that we have these two routes,  visiting the uri __localhost:3000/artists/__ will cause the application to call the **index** action in the **ArtistsController**.

```ruby
class ArtistsController < ApplicationController
  def index
    @artists = Artist.all
  end
end
```

It is important to use an instance variable (variables with the **@** sign)  so that they can be used in the view:

```erb
<% @artists.each do |artist| %>
  <tr>
    <td><%= artist.id  %></td>
    <td><%= artist.name %></td>
    <td>
      <%= link_to 'Show', artist_path(artist) %>
    </td>
  </tr>
<% end %>
```

The `link_to` above is a Rails helper that we can use to create _anchor tags_ to link to another route within our application. In this case, it's going to link to `/artists/:id`, which will call the **show** action in the **ArtistsControllers**:

```ruby
def show
  @artist = Artist.find(params[:id])
end
```

