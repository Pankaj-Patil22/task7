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
