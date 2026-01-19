#!/bin/bash

echo "1. 프로젝트 폴더로 이동"
cd ~/workspace/todo-repository || { echo "폴더가 없습니다"; exit 1; }

echo "2. 최신 코드 pull"
git pull

echo "3. 기존 uvicorn 프로세스 종료"
pkill -f uvicorn || true

echo "잠시 대기 (포트 반환 기다림)..."
sleep 2

echo "4. 서버 백그라운드 실행"
nohup uv run uvicorn main:app --host 0.0.0.0 --port 8000 > server.log 2>&1 &

echo "배포가 완료되었습니다!"