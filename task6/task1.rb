class Serial
    @SSS
    @XX
    @YY
    @ZZ

    def serial_average(str)

        begin
            arr=str.split('-')
            raise ArgumentError, "String is not in the format SSS-XX.XX-YY.YY" if str !~ /\d{3}-\d{2}.\d{2}-\d{2}.\d{2}\z/
            # If you're depending on the regular expression for validation, you always want to use \A and \z. ^ and $ will only match up until a newline character, which means they could use an email like me@example.com\n<script>dangerous_stuff();</script> and still have it validate, since the regex only sees everything before the \n.
            # My recommendation would just be completely stripping new lines from a username or email beforehand, since there's pretty much no legitimate reason for one. Then you can safely use EITHER \A \z or ^ $.
            
            @SSS=arr[0]
            @XX=("%.2f" % arr[1].to_f).to_f
            @YY=("%.2f" % arr[2].to_f).to_f

            @ZZ="%.2f" % ((@XX+@YY)/2).round(2)
    
            str1=@SSS+"-"+@ZZ.to_s

            return str1
        rescue ArgumentError 
            return "String is not in the format SSS-XX.XX-YY.YY"
        end
    end
end

class HashTest

    attr_accessor :hash

    def initialize
        @hash = {"a" => 1, "b" => 2, "c" => 3, 12=>54, 34=>21, 56=>78, 11=>22, 33=>44, 55=>66}
        @hash.store(543121, 100)
    end

    def add_element(key, value)
       begin
            #raise exception if key already exists
            raise Exception,"Key already exists cannot modify" if @hash.has_key?(key)
            @hash.store(key, value) 
       rescue Exception 
            return "Key already exists cannot modify" 
       end
    end
    
    def retain_if_integer
        @hash.delete_if {|key, value| key.is_a?(Integer) == false}
    end

    def delete_if_even
        @hash.delete_if {|key, value| key.is_a?(Integer) == true && key % 2 == 0}
    end

    def print_hash
        puts @hash
    end

end
