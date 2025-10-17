#!/bin/bash

# bootc VM에서 실행할 설치 스크립트

set -e

echo "Installing bootc auto-updater..."

# 스크립트 복사
sudo cp bootc-update.sh /usr/local/bin/
sudo chmod +x /usr/local/bin/bootc-update.sh

# systemd 파일 복사
sudo cp bootc-update.service /etc/systemd/system/
sudo cp bootc-update.timer /etc/systemd/system/

# systemd 재로드
sudo systemctl daemon-reload

# timer 활성화 및 시작
sudo systemctl enable bootc-update.timer
sudo systemctl start bootc-update.timer

echo "Installation complete!"
echo "Check status with: systemctl status bootc-update.timer"
echo "Check logs with: journalctl -u bootc-update.service -f"

# 타이머 상태 확인
systemctl list-timers bootc-update.timer