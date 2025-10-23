from fastapi import FastAPI
from pydantic import BaseModel

app = FastAPI(title="Autoppia Agent API")

class Task(BaseModel):
    id: str
    prompt: str
    url: str
    html: str

@app.get("/health")
async def health_check():
    return {"status": "ok"}

@app.post("/solve_task")
async def solve_task(task: Task):
    # Placeholder for task-solving logic
    return {"task_id": task.id, "actions": []}
