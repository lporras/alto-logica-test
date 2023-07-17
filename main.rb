require './lib/receipt_calculator.rb'

# Get the current directory
current_directory = Dir.pwd

data_folder = 'data'

full_path = File.join(current_directory, data_folder)

# Get a list of .txt files in the directory
txt_files = Dir.glob(File.join(full_path, '*.txt'))

# Read the contents of each .txt file
txt_files.each_with_index do |txt_file, index|
  File.open(txt_file, 'r') do |file|
    puts "\nreading file No. #{index + 1}: \n"

    recepit = ReceiptCalculator.new

    file.each_line do |line|
      recepit.add_product(line)
    end

    puts recepit.print_taxes
  end
end

