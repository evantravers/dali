# Dali

A simple gem for generating html pages for emails or webpages, taking a content.yml and a mustache template as arguments

## Usage

1. Clone this repo
2. gem install
3. rake install
4. PROFIT.

dali example.yml mustache_template.html

this will return an html file based on the title field of your example.xml

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

TODO:

- meta magic with sluggifying links and such
- automatically looking for an images folder, and zipping up it's contents to go with the new html file
