const fs = require("fs");
const redis = require("redis");

const client = redis.createClient();

const filePath = "C:\\Users\\dima\\Desktop\\DevOps_lab\\cronjob\\data.txt"; // Змінено для правильного формату шляху
const redisKey = "key";

function checkFileSizeAndDate() {
  fs.stat(filePath, (err, stats) => {
    if (err) {
      console.error(err);
      return;
    }

    const fileSize = stats.size;
    const fileDate = stats.mtime.toISOString(); // Отримуємо дату зміни файлу у форматі ISO

    client.get(redisKey, (redisErr, redisValue) => {
      if (redisErr) {
        console.error(redisErr);
        return;
      }

      const storedFileSize = parseInt(redisValue);
      const storedFileDate = client.hget(redisKey, 'date'); // Отримуємо збережену дату з Redis

      if (storedFileSize !== fileSize || storedFileDate !== fileDate) {
        console.log("Розмір або дата файлу змінилися.");
        client.hmset(redisKey, 'size', fileSize, 'date', fileDate); // Записуємо розмір і дату в Redis
      } else {
        console.log("Розмір та дата файлу залишаються незмінними.");
      }
    });
  });
}

checkFileSizeAndDate();
