require 'unirest'

module MakerBlog

  class Client

    def list_posts
        response = Unirest.get("http://makerblog.herokuapp.com/posts",
          headers: { "Accept" => "application/json" })
        posts = response.body
        if response.code == 200
          posts.each do |post|
            puts "#{post['name']} | #{post['title']} | #{post['content']}"
          end
        else
          puts "Unsuccessful request."
        end
    end

    def show_post(id)
      # hint: URLs are strings and you'll need to append the ID
      url = "http://makerblog.herokuapp.com/posts/#{id}"

      response = Unirest.get(url,
        headers: { "Accept" => "application/json" })
      if response.code == 200
        puts response.body
      else
        puts "Unsuccessful request."
      end
    end

    def create_post(name, title, content)
      url = "http://makerblog.herokuapp.com/posts"
      payload = {:post => {'name' => name, 'title' => title, 'content' => content}}

      response = Unirest.post(url,
        headers: { "Accept" => "application/json",
                   "Content-Type" => "application/json" },
        parameters: payload)
      if response.code == 201
        # convert then display your results here
        new_post = response.body
        puts "#{new_post["name"]} | #{new_post["title"]} | #{new_post["content"]}"
      else
        puts "Unsuccessful request."
      end
    end

    def edit_post(id, options = {})
      url = "http://makerblog.herokuapp.com/posts/#{id}"
      params = {}

      # can't figure this part out? Google "ruby options hash"
      params[:name] = options[:name] unless options[:name].nil?
      params[:title] = options[:title] unless options[:title].nil?
      params[:content] = options[:content] unless options[:content].nil?

      response = Unirest.put(url,
        parameters: { :post => params },
        headers: { "Accept" => "application/json",
                   "Content-Type" => "application/json" })

      if response.code == 201
        edited_post = response.body
        puts "#{edited_post["name"]} | #{edited_post["title"]} | #{edited_post["content"]}"
      else
        puts "Unsuccessful request."
      end

    end

    def delete_post(id)
      url = "http://makerblog.herokuapp.com/posts/#{id}"
      response = Unirest.delete(url,
        headers: { "Accept" => "application/json" })
      if response.code == 200
         puts response.code
      else
        puts "Unsuccessful request."
      end
    end

  end

end
client = MakerBlog::Client.new
client.list_posts
