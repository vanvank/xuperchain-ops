#!/usr/bin/env python3
import time
import os
import logging

# 删除指定目录下大于n天的文件
# 1. 获取目录下所有文件
# 2. 获取文件的时间戳，判断是否大于n天
# 3. 如果大于n天，则删除
# 加入crontab
# 0 * * * * cd /data/scripts;./del_file.py

LOG_FORMAT = "%(asctime)s - %(levelname)s - %(message)s"
DATE_FORMAT = "%m/%d/%Y %H:%M:%S %p"
logging.basicConfig(filename='chain_log_del.log', level=logging.DEBUG, format=LOG_FORMAT, datefmt=DATE_FORMAT)

def get_mtime_2_today(file_path):
    file_mtime = os.path.getmtime(file_path)
    today = time.time()
    mtime_2_today = (today - file_mtime)/3600/24
    return round(mtime_2_today, 2)


def del_file(file_path, past_days):
    if get_mtime_2_today(file_path) > past_days:
        os.remove(file_path)
        print(file_path + " to be removed")
        return True
        
def del_file_by_dir(dir_path, past_days):
    os.chdir(dir_path)
    logging.info(f'---start---{dir_path}')
    files = os.listdir(dir_path)
    for file in files:
        if del_file(file, past_days):
            logging.info(file+ " deleted !!!")
    logging.info(f'---end---{dir_path}')


if __name__ == '__main__':
    chain_base_dir = os.environ.get('CHAIN_BASE_DIR')
    dirs = []
    for i in range(1,4):
        dirs.append(f'{chain_base_dir}/node{i}/logs')
    print(dirs)

    for dir in dirs:
        del_file_by_dir(dir, 3)
