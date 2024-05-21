import sys

def replace_word_in_file(input_file):
    output_file = f"{input_file}.new"
    
    with open(input_file, 'r') as f_in:
        content = f_in.read()
        modified_content = content.replace('SAEARCH', 'REPLACE')

    with open(output_file, 'w') as f_out:
        f_out.write(modified_content)

    print(f"Output file is this one '{output_file}'")

input_file = input("Enter the path to the input file: ")
replace_word_in_file(input_file)