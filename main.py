import logging
import logging
import os
import exceptions

import aiohttp
import aiogram

from aiogram import Bot, Dispatcher, executor, types
from middlewares import AccessMiddleware


API_TOKEN = '5047453105:AAHdCixXjp9S8zlNaqdOymZ0-SW20s_cyc8'
TELEGRAM_ACCESS_ID = '701722851'
# Configure logging
logging.basicConfig(level=logging.INFO)

# Initialize bot and dispatcher
bot = Bot(token=API_TOKEN)
dp = Dispatcher(bot)
dp.middleware.setup(AccessMiddleware(TELEGRAM_ACCESS_ID))


@dp.message_handler(commands=['start', 'help'])
async def send_welcome(message: types.Message):
    """Отправляет приветственное сообщение и помощь по боту"""
    await message.answer(
        "Бот для учёта финансов\n\n"
        "Добавить расход: 250 такси\n"
        "Сегодняшняя статистика: /today\n"
        "За текущий месяц: /month\n"
        "Последние внесённые расходы: /expenses\n"
        "Категории трат: /categories")
