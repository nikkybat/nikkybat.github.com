module Jekyll
  class Post
    # I use permalink /:year/:month/:day, and do not need :title
    remove_const :MATCHER
    MATCHER = /^(.+\/)*(\d+-\d+-\d+)(.*?)(\.[^.]+)$/
  end
end
