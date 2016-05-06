for ((i = 0; i < 12; ++i)); do
    rsync -avz --delete --progress --password-file=/OnlineJudge/dockerfiles/test_case_rsync/rsyncd.passwd ojrsync@RSYNC_MASTER_ADDR::testcase /OnlineJudge/test_case
    sleep 5
done
