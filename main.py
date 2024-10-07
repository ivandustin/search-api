from asyncio import Queue as AsyncQueue
from subprocess import Popen, PIPE
from threading import Thread
from shutil import which
from queue import Queue
from fastapi import FastAPI

queue = Queue()
app = FastAPI()
bash = which("bash")
process = Popen(
    [bash, "-c", "search"],
    stdin=PIPE,
    stdout=PIPE,
    stderr=PIPE,
    text=True,
)


@app.get("/")
async def read_root(q: str) -> list[str]:
    async_queue = AsyncQueue()
    queue.put((q, async_queue))
    line = await async_queue.get()
    refs = line.split(" ")
    return refs


def main():
    while True:
        query, async_queue = queue.get()
        process.stdin.write(query + "\n")
        process.stdin.flush()
        async_queue.put_nowait(process.stdout.readline().strip())


Thread(target=main, daemon=True).start()
