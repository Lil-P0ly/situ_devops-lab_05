# Лаб 7. Docker basics

## Описание задачи

Создан Docker-образ, который при запуске:

- поднимает веб-сервер Nginx;
- отдаёт статическую HTML-страницу с приветствием;
- открыт наружу на порт 54321 (проброс хоста → контейнер);
- запускается через shell-скрипт.

## Дополнительное задание (HTTPS)

- Сгенерирован самоподписанный SSL-сертификат;
- Nginx работает по HTTPS-протоколу;
- Сертификат пробрасывается в контейнер через volume mapping;
- Есть скрипт обновления сертификата с командой `nginx -s reload` внутри контейнера.



## Инструкции по запуску

### 1. Сгенерировать SSL-сертификат

```bash
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout ./certs/nginx.key \
  -out ./certs/nginx.crt \
  -subj "/C=RU/ST=Perm/L=Perm/O=SITU/OU=devops/CN=localhost/emailAddress=makskryzh@gmail.com"
```

### 2. Собрать Docker-образ

```bash
docker build -t nginx-situ-lab:latest .
```

### 3. Запустить контейнер

```bash
docker run -p 54321:443 -v ./certs:/etc/ssl --name nginx-ssl -tid nginx-situ-lab
```

Контейнер будет доступен по адресу:  
`https://localhost:54321`

*Для локального доступа может потребоваться добавить исключение для самоподписанного сертификата.*

## Обновление сертификата

Для пересоздания сертификата и его перезагрузки в контейнере:

```bash
./update.sh
```
## Демонстрация работы
![Снимок экрана от 2025-06-14 18-49-42](https://github.com/user-attachments/assets/fc8a41ff-b4c9-42d5-9f63-52202e99b09b)
