# error_logging.py
# This module improves error handling with detailed logs and notifications.

import logging

logging.basicConfig(level=logging.INFO)


def log_error(error_message):
    # Log the error message
    logging.error(error_message)
