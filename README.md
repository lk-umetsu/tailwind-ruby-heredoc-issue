# tailwindcss-ruby heredoc issue

Reproduces an issue in `tailwindcss-ruby` v4.2.0 where class names inside Ruby heredoc interpolation (`#{...}`) are not scanned, while the same pattern in regular strings works fine.

```ruby
def width_class_heredoc(width = nil)
  <<~STYLE_CLASS
    inline-flex
    #{width || 'w-100'}
  STYLE_CLASS
end
```

## Reproduce

### tailwindcss v4.2.0
```sh
chmod +x run.sh && ./run.sh
```

```
---- compile result ---
w-100 (heredoc)     : not found  # bug: should be found
w-99 (interpolation): found
w-98 (plain)        : found
```


### tailwindcss v4.1.16
```sh
git fetch
git checkout v-4-1-16
chmod +x run.sh && ./run.sh
```

```
---- compile result ---
w-100 (heredoc)     : found
w-99 (interpolation): found
w-98 (plain)        : found
```
