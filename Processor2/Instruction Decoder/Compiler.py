import re

machineCode = []


def to_4_bit_signed_binary(number):
    if not (-8 <= number <= 7):
        raise ValueError("Number must be between -8 and 7 (inclusive).")

    if number >= 0:
        binary_string = format(number, '04b')
    else:
        two_complement = (number + 16) % 16
        binary_string = format(two_complement, '04b')

    return binary_string


def AddFunc(rest, no):
    if re.fullmatch(r'[r][0-7],[r][0-7]', rest):
        splitS = rest.split(",")
        firstR = int(splitS[0][-1])
        if firstR == 0 or firstR == 1 or firstR == 2:
            print(f"line {no}: WARNING: R{firstR} is a Read-Only Register.")
        secondR = int(splitS[1][-1])
        bs1 = bin(firstR)[2:].zfill(3)
        bs2 = bin(secondR)[2:].zfill(3)
        return "0000" + bs1 + bs2 + "0000"
    else:
        print(f"line {no}: ERROR")



def SubFunc(rest, no):
    if re.fullmatch(r'[r][0-7],[r][0-7]', rest):
        splitS = rest.split(",")
        firstR = int(splitS[0][-1])
        if firstR == 0 or firstR == 1 or firstR == 2:
            print(f"line {no}: WARNING: R{firstR} is a Read-Only Register.")
        secondR = int(splitS[1][-1])
        bs1 = bin(firstR)[2:].zfill(3)
        bs2 = bin(secondR)[2:].zfill(3)
        return "0001" + bs1 + bs2 + "0000"
    else:
        print(f"line {no}: ERROR")


def MoviFunc(rest, no):
    if re.fullmatch(r'r[0-7],-?[0-7]|r[0-7],-8', rest):
        splitS = rest.split(",")
        firstR = int(splitS[0][-1])
        if firstR == 0 or firstR == 1 or firstR == 2:
            print(f"line {no}: WARNING: R{firstR} is a Read-Only Register.")
        bs1 = bin(firstR)[2:].zfill(3)
        second = int(splitS[1])
        data = to_4_bit_signed_binary(second)
        return "0010" + bs1 + "000" + data+""
    else:
        print(f"line {no}: ERROR")


def JZRFunc(rest, no):
    if re.fullmatch(r'[r][0-7],[1-9]|[r][0-7],1[0-6]', rest):
        splitS = rest.split(",")
        firstR = int(splitS[0][-1])
        secondR = int(splitS[1]) - 1
        bs1 = bin(firstR)[2:].zfill(3)
        bs2 = bin(secondR)[2:].zfill(4)
        return "0011" + bs1 + "000" + bs2+""
    else:
        print(f"line {no}: ERROR")


def INC(rest, no):
    rest = rest.strip()
    if re.fullmatch(r'[r][0-7]', rest):
        firstR = int(rest[-1])
        if firstR == 0 or firstR == 1 or firstR == 2:
            print(f"line {no}: WARNING: R{firstR} is a Read-Only Register.")
        bs1 = bin(firstR)[2:].zfill(3)
        return "0100" + bs1 + "0010000"
    else:
        print(f"line {no}: ERROR")


def DEC(rest, no):
    rest = rest.strip()
    if re.fullmatch(r'[r][0-7]', rest):
        firstR = int(rest[-1])
        if firstR == 0 or firstR == 1 or firstR == 2:
            print(f"line {no}: WARNING: R{firstR} is a Read-Only Register.")
        bs1 = bin(firstR)[2:].zfill(3)
        return "0101" + bs1 + "0100000"
    else:
        print(f"line {no}: ERROR")


def NEG(rest, no):
    rest = rest.strip()
    if re.fullmatch(r'[r][0-7]', rest):
        firstR = int(rest[-1])
        if firstR == 0 or firstR == 1 or firstR == 2:
            print(f"line {no}: WARNING: R{firstR} is a Read-Only Register.")
        bs1 = bin(firstR)[2:].zfill(3)
        return "0110" + bs1 + "0000000"
    else:
        print(f"line {no}: ERROR")


def RES(rest, no):
    rest = rest.strip()
    if re.fullmatch(r'[r][0-7]', rest):
        firstR = int(rest[-1])
        if firstR == 0 or firstR == 1 or firstR == 2:
            print(f"line {no}: WARNING: R{firstR} is a Read-Only Register.")
        bs1 = bin(firstR)[2:].zfill(3)
        return "0111" + bs1 + "0000000"
    else:
        print(f"line {no}: ERROR")


def COM(rest, no):
    if re.fullmatch(r'[r][0-7],[r][0-7]', rest):
        splitS = rest.split(",")
        firstR = int(splitS[0][-1])
        secondR = int(splitS[1][-1])
        bs1 = bin(firstR)[2:].zfill(3)
        bs2 = bin(secondR)[2:].zfill(3)
        return "1000" + bs1 + bs2 + "0000"
    else:
        print(f"line {no}: ERROR")

def IFAG(rest, no):
    if re.fullmatch(r'[r][0-7],[r][0-7],[0-9]|[r][0-7],[r][0-7],1[0-6]', rest):
        splitS = rest.split(",")
        firstR = int(splitS[0][-1])
        secondR = int(splitS[1][-1])
        address = int(splitS[2]) - 1
        bs1 = bin(firstR)[2:].zfill(3)
        bs2 = bin(secondR)[2:].zfill(3)
        addressBin = bin(address)[2:].zfill(4)
        return "1010"+bs1+bs2+addressBin
    else:
        print(f"line {no}: ERROR")

def IFE(rest, no):
    if re.fullmatch(r'[r][0-7],[r][0-7],[0-9]|[r][0-7],[r][0-7],1[0-6]', rest):
        splitS = rest.split(",")
        firstR = int(splitS[0][-1])
        secondR = int(splitS[1][-1])
        address = int(splitS[2]) - 1
        bs1 = bin(firstR)[2:].zfill(3)
        bs2 = bin(secondR)[2:].zfill(3)
        addressBin = bin(address)[2:].zfill(4)
        return "1011"+bs1+bs2+addressBin
    else:
        print(f"line {no}: ERROR")

def IFNE(rest, no):
    if re.fullmatch(r'[r][0-7],[r][0-7],[0-9]|[r][0-7],[r][0-7],1[0-6]', rest):
        splitS = rest.split(",")
        firstR = int(splitS[0][-1])
        secondR = int(splitS[1][-1])
        address = int(splitS[2]) - 1
        bs1 = bin(firstR)[2:].zfill(3)
        bs2 = bin(secondR)[2:].zfill(3)
        addressBin = bin(address)[2:].zfill(4)
        return "1100"+bs1+bs2+addressBin
    else:
        print(f"line {no}: ERROR")
def is_not_single_word(string):
    # Define a regex pattern that matches any string containing whitespace
    # or punctuation characters other than a single word
    pattern = r'\s'

    # Use re.search to search for the pattern in the string
    if re.search(pattern, string):
        return True  # The string is not a single word (contains whitespace)
    else:
        return False  # The string is a single word (does not contain whitespace)

def write_list_to_file(filename, data_list, lines):
    # Open the file in write mode
    with open(filename, 'w') as file:
        n = len(data_list)

        # Iterate through the list and write each element to the file
        for x in range(n-1):
            # Convert the item to a string and write it to the file with a newline
            file.write(f"\"{data_list[x]}\", --{lines[x].upper().strip()}\n")
        file.write(f"\"{data_list[n-1]}\" --{lines[n-1].upper().strip()}")
        file.close()
def compileLine(line, no):
    rest = ""
    if is_not_single_word(line):
        splitS = line.split(" ", 1)
        rest = splitS[1].replace(" ", "")
    else:
        splitS = [line]
    function = splitS[0]
    match function:
        case "add":
            return AddFunc(rest, no)
        case "sub":
            return SubFunc(rest, no)
        case "movi":
            return MoviFunc(rest, no)
        case "jzr":
            return JZRFunc(rest, no)
        case "inc":
            return INC(rest, no)
        case "dec":
            return DEC(rest, no)
        case "neg":
            return NEG(rest, no)
        case "res":
            return RES(rest, no)
        case "com":
            return COM(rest, no)
        case "nop":
            return "10010000000000"
        case "ifag":
            return IFAG(rest, no)
        case "ife":
            return IFE(rest, no)
        case "ifne":
            return IFNE(rest, no)
        case _:
            print(f"line {no}: ERROR: Keyword {function.upper()} isn't recognized.")


fileToCompile = open('code.txt', 'r')
lines = fileToCompile.readlines()
if len(lines) > 16:
    print("ERROR: Too many lines of code")
else:
    x = 0
    for line in lines:
        x += 1
        line = line.strip()
        line = line.lower()
        machineCode.append(compileLine(line, x))
    print(x)

    if None in machineCode:
        print("Compilation Failed")
    else:
        for n in range(16-x):
            machineCode.append("10010000000000")
            lines.append("Filled in with NOP")
        print(lines)
        write_list_to_file("code.txt", machineCode, lines)
        print("Compilation Successful")
