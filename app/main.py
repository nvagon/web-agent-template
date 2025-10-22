from fastapi import FastAPI

from autoppia_iwa.src.data_generation.domain.classes import Task

app = FastAPI(title="Autoppia Agent API")

@app.get("/health")
async def health_check():
    return {"status": "ok"}

@app.post("/solve_task")
async def solve_task(task: Task):
    # Placeholder for task-solving logic
    return {"task_id": task.id, "actions": []}
