from pathlib import Path
import string

bash_path = '/Path_To_Files/'
input_file = bash_path + 'pg100.txt'
output_file = bash_path + 'pg100_nopunct.txt'

filepath = Path(input_file)
text = filepath.read_text()
text = text.translate(str.maketrans('', '', string.punctuation))

filepath_out = Path(output_file)
filepath_out.write_text(text)
