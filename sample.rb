# will NOT be scanned v4.2.0 (But will be scanned in v4.1.16)
def width_class_heredoc(width = nil)
  <<~STYLE_CLASS
    inline-flex
    #{width || 'w-100'}
  STYLE_CLASS
end

# will be scanned
def width_class_interpolation(width = nil)
  "#{width || 'w-99'}" + " flex-1"
end

# will be scanned
def width_class_plain(width = nil)
  width || 'w-98'
end
