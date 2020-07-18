# INSTALL
```
unzip instantclient-basic-linux.x64-19.6.0.0.0dbru.zip
```
```
sudo apt-get install python3.7-dev
python 3.7 -m venv venv
source venv/bin/activate
```
```
export LD_LIBRARY_PATH=./instantclient_19_6:$LD_LIBRARY_PATH
pip install -r requirements.txt
```
# RUN

```
python main_bd.py
```

Os comandos SQL da aplicação estão no arquivo banco.py