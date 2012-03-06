require 'mechanize'


# A little app to extract google's main entry image
agent = Mechanize.new
#url=http://www.google.com
url = "http://www.google.com.br/webhp?hl=en"
page = agent.get('http://www.google.com.br')
element=page.search('#hplogo')[0]
image_url=
    if element.name=="img" then
        element.attr("src")
    else
        regex=/background:.*url\(([^)]*)\)/
        matches=regex.match(element.attr('style'))
        if matches[1] then matches[1] else "http://biosensic.com/not_found.gif" end
    end
puts(image_url)
img=agent.get(image_url)
img.save("today.png") 