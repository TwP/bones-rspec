# bones-rspec

A plugin for [Mr Bones](http://rugyems.org/gems/bones) that incorporates rake
tasks for running RSpec style tests.

## DESCRIPTION

The rspec package for Mr Bones provides tasks to incorporate rspec tests into
bones based projects. It also works in tandem with the bones-rcov plugin to
run code coverage over your specs.

This plugin is compatible with both RSpec version 1 and RSpec version 2. If
you have both RSpec versions installed this plugin will favor the newer
version of RSpec. To force use of the older RSpec version, use the **gem**
command in your Rakefile to load the appropriate version.

    gem 'rspec', '~> 1.3.0'

    Bones {
      name   'my-awesome-gem'
      ...
    }

The gem command must appear before the Bones configuration block.

## INSTALL

    gem install bones-rspec

#### LICENSE

*The MIT License*

Copyright (c) 2010

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
