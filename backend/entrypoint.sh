#!/bin/sh

# Ждём запуска PostgreSQL
echo "⏳ Ожидание PostgreSQL..."
while ! nc -z postgres 5432; do
  sleep 1
done
echo "✅ PostgreSQL готов!"

# Применяем миграции
echo "🚀 Применяем миграции..."
python manage.py migrate --noinput

# Собираем статику (в volume static)
echo "📦 Собираем статику..."
python manage.py collectstatic --noinput

# Запускаем приложение
exec "$@"