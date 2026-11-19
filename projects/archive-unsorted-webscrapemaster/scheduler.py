# scheduler.py
# This module handles scheduling scraping tasks at specific intervals or times.

import schedule
import time

def schedule_scraping(task, interval):
    # Schedule the scraping task
    schedule.every(interval).minutes.do(task)

    while True:
        schedule.run_pending()
        time.sleep(1)
