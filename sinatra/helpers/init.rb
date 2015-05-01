def image_tag(path, name)
  "<img src='#{path}' alt='#{name}' />"
end

def link_to(name, path)
  "<a href='#{path}' />#{name}</a>"
end