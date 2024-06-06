
import shutil
import os

GIT = os.getcwd()
print(GIT)
BIN_PATH = 'build'


if __name__ == '__main__':

    for root, dirs, files in os.walk(os.path.join(GIT, BIN_PATH)):
        for file in files:
            if file.endswith('.epf'):
                
                if file == 'FeatureReader.epf':
                    new_file = 'vbFeatureReader.epf'
                else:
                    new_file = file
                full_path_src = os.path.join(root, file)
                full_path_dst = os.path.join(root.replace(os.path.join(GIT, BIN_PATH), GIT), new_file)
                print(full_path_src + ' - ' + full_path_dst)

                shutil.copy(full_path_src, full_path_dst)