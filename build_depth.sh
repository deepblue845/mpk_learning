git clone --recursive --branch mpk https://www.github.com/mirage-project/mirage
docker run -it  --gpus all  --runtime=nvidia  --name test3 -v /usr/lib/x86_64-linux-gnu:/usr/lib/x86_64-linux-gnu -v /home/exouser/chw/mirage:/workspace/mirage deepblue8459/mpk:latest bash
cd mirage
pip install -e . -v
export MIRAGE_HOME=$(pwd)
docker start -i test3

python demo/qwen3/demo.py   --use-mirage   --max-num-batched-tokens 4   --max-seq-length 256 --max-num-batched-requests 4 --save-tokens auto > mirage_debug_output.txt 2>&1