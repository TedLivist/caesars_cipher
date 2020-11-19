def caesar_cipher str, shift = 0

  alphabets = {
  "a" => 1, "b" => 2, "c" => 3, "d" => 4,
  "e" => 5, "f" => 6, "g" => 7, "h" => 8,
  "i" => 9, "j" => 10, "k" => 11, "l" => 12,
  "m" => 13, "n" => 14, "o" => 15, "p" => 16,
  "q" => 17, "r" => 18, "s" => 19, "t" => 20,
  "u" => 21, "v" => 22, "w" => 23, "x" => 24,
  "y" => 25, "z" => 26
  }

  str = str.split("")
  caesar_arr = []
  str.each do |letter|
    check_case = letter
    letter = letter.downcase
    if letter.match(/[a-z]/) then
      alphabets.each do |alphabet, position|
        if letter == alphabet
          if check_case == letter.upcase
            caesar_arr << { check_case => position }
          else
            caesar_arr << { alphabet => position }
          end
        end
      end
    else
      caesar_arr << letter
    end
  end

  final_cipher = []

  caesar_arr.each do |letter|
    keep_case = ""
    if letter.is_a? Hash
      keep_case = letter.keys[0]
    end
    if ((letter.is_a? String) == false)
      letter.each do |key, value|
        value = value + shift
        if value > 26 then
          value = value - 26
        end

        if keep_case == letter.keys[0].upcase
          final_cipher << alphabets.key(value).upcase
        else
          final_cipher << alphabets.key(value)
        end
      end
    else
      final_cipher << letter
    end

  end
  final_cipher.join("")
end