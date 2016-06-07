module SchemeToInterface
  class Interface
    @@template = <<-template

# Auto-generated Interface colors
# Scheme2Interface.rb by Defman
# http://defman.me/projects/ko-s2i/

def _(val):
    if type(val) == int:
        return val

    val = val.lstrip('#')
    if len(val) == 3:
        val += val

    r,g,b = int(val[:2], 16), int(val[2:4], 16), int(val[4:], 16)
    color = r+g*256+b*256*256
    return color

colors = {
  '00': _('%s'),
  '01': _('%s'),
  '02': _('%s'),
  '03': _('%s'),
  '04': _('%s'),
  '05': _('%s'),
  '06': _('%s'),
  '07': _('%s'),

  '08': _('%s'), # red
  '09': _('%s'), # orange
  '0a': _('%s'), # yellow
  '0b': _('%s'), # green
  '0c': _('%s'), # cyan
  '0d': _('%s'), # blue
  '0e': _('%s'), # purple
  '0f': _('%s')  # brown
}

InterfaceStyles = {
  'border': {'back': colors['03']},
  'button': {'back': colors['02']},
  'caption': {'fore': colors['07']},
  'contrast': {'back': colors['01']},
  'contrast widget': {'back': colors['02']},
  'css': {'code': '@import url(\"chrome://komodo/skin/global/colors.less\");\\n@import url(\"resource://profile/colors.less\");\\n'},
  'icons': {'fore': colors['06']},
  'icons special': {'fore': colors['06']},
  'icons widget': {'fore': colors['06']},
  'scc conflict': {'fore': colors['0e']},
  'scc deleted': {'fore': colors['08']},
  'scc modified': {'fore': colors['0a']},
  'scc new': {'fore': colors['0b']},
  'scc ok': {'fore': colors['07']},
  'scc sync': {'fore': colors['0c']},
  'secondary special': {'fore': colors['03']},
  'selected': {'back': colors['02'], 'fore': colors['07']},
  'special': {'back': colors['00'], 'fore': colors['07']},
  'special contrast': {'back': colors['01']},
  'special widget': {'back': colors['02'], 'fore': colors['07']},
  'state error': {'back': colors['08']},
  'state foreground': {'fore': colors['07']},
  'state info': {'back': colors['0c']},
  'state ok': {'back': colors['0b']},
  'state warning': {'back': colors['0a']},
  'textbox': {'back': colors['01'], 'fore': colors['07']},
  'textbox special': {'back': colors['02'], 'fore': colors['07']},
  'textbox widget': {'back': colors['01'], 'fore': colors['07']},
  'widget': {'back': colors['01'], 'fore': colors['06']},
  'window': {'back': colors['00'],
              'face': '%s',
              'fore': colors['07'],
              'size': '%s'},
  'window button close': {'back': colors['08']},
  'window button maximize': {'back': colors['0b']},
  'window button minimize': {'back': colors['0a']}
}
      template
      class << self
        def template
          @@template
        end
      end
  end
end
