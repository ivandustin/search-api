from asyncio import Queue
from fastapi.middleware.cors import CORSMiddleware
from fastapi import FastAPI
from shellfifo import create


queue = create("search")
app = FastAPI()

app.add_middleware(CORSMiddleware, allow_origins=["*"])


@app.get("/")
async def get(q: str) -> list[str]:
    channel: Queue = Queue()
    queue.put((q, channel))
    line = await channel.get()
    refs = line.split(" ")
    return refs
