#!/usr/bin/sh ruby

class ImageIndex
  class << self
    def file_list(dir = '$PWD')
      @ff ||= `find #{dir} -type f`.split("\n")
    end

    def bad_extensions
      @bad_ext ||= %w(.gifv .html .js .css .webarchive)
    end

    def property_map
      @property_map ||= file_list.
        reject {|f| File.extname(f).empty? || bad_extensions.include?(File.extname(f)) }.
        map    {|f| (`identify -format  '%w %h %[fx:w/h] %[size]' "#{f}"`).split.unshift(f) }
    end

    def tall(opts={'ratio'=>0.6})
      opts['ratio'].to_f = 1 / opts['ratio'].to_f if opts['ratio'].to_f > 1
      seek opts
    end

    def wide(opts={'ratio'=>1.6})
      opts['ratio'].to_f = 1 / opts['ratio'].to_f if opts['ratio'].to_f < 1
      seek opts
    end

    def seek(opts)
      raise InputError.new('options hash required') unless
        opts.is_a?(Hash) &&
        opts['ratio']

      opts.merge!({
        'size'   => '500KB',
        'height' => 0,
        'width'  => 0
      })
      opt_size = opts['size'][0..-2].to_i
      opt_unit = opts['size'][-2..-1]

      property_map.select do |f,h,w,r,s|
        size = s[0..-2].to_i
        unit = s[-2..-1]

        ratio_test(opts['ratio'],r) &&
        (opt_unit < unit ||
         opt_size < size)
      end
    end

    private

    def ratio_test(r_thresh, r)
      if r_thresh < 1 && r.to_f < 1
        return true if r.to_f < r_thresh
      else
        return true if r.to_f > r_thresh
      end
    end
  end

end

