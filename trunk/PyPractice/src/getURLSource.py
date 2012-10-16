# get source of an url
import urllib2
url = 'http://infonam.com'
usock=urllib2.urlopen(url)
urlSource = usock.read()
print urlSource;