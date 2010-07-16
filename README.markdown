## ABOUT

Ruby API to geographic operations. Currently it supports:

* Validation of an address
* Distance between two addresses.
* Map with route between two addresses

## USAGE

    address = Address.new "Rua Tenerife, 31, Sao Paulo, Brasil"
    address.exists?
    address.distance_to "Av Paulista, Sao Paulo, Brasil"

    direction = GoMaps::Direction.new(:from => "Av Paulista 100, Sao Paulo, Brasil", :to => "Avenida Brigadeiro Faria Lima 1000, Sao Paulo, Brasil")
    direction.to_map
    direction.to_map(:width => 400, :height => 700)
    direction.to_html

## LICENSE

(The MIT License)

Copyright © 2010

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
‘Software’), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED ‘AS IS’, WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
