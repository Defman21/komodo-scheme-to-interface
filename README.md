Scheme To Interface
===

This tool allows you to convert Komodo 9 color scheme to Komodo 10.
The difference between them is `InterfaceStyles` block, which you
can configure to change style of different Komodo UI elements.

This tool takes some colors from the scheme you want, convert them
to base16-like colors (lighten/darken background/foreground) and
generate a new ksf file.

Note the results may not be very good, you probably will have to tweak it a
bit. I'm working on the formulas to get the best colors, but it's hard.

## Installation

```sh
git clone https://github.com/Defman21/komodo-scheme-to-interface
```

## Requirements

* Ruby 1.9.3 or above
* Python **2.7**

## Usage

```sh
ruby ./main.rb
```

## Note

Font size should be set with font size type (`pt`, `em`, `rem` or others),
like `10pt`, `1rem`, `1em`.

Thanks [**@Naatan**](https://github.com/Naatan) for his KSF wrapper!
