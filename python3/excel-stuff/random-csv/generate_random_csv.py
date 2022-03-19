import random
import os

count = 100

csv_path = os.path.abspath("./daRandomCSV.csv")


# our RNG function
def click(prob_of_win=3300):
    a = random.randint(0, 10000)
    if a < prob_of_win:
        return True
    return False


if __name__ == '__main__':

    # delete file if exists
    if os.path.exists(csv_path):
        os.remove(csv_path)

    # write data to a file
    with open(csv_path, 'w') as csv_file_handle:

        csv_file_handle.write("result,result except its an int :P\n")

        while count > 0:
            result = ((click(prob_of_win=3300)))

            csv_file_handle.write(str(result))
            csv_file_handle.write(',')

            csv_file_handle.write(str(1 if result else 0))

            csv_file_handle.write("\n")

            count -= 1

    print("Done! Open {}".format(csv_path))
