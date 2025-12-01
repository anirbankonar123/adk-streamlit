#### Install uv <br>
curl -LsSf https://astral.sh/uv/install.sh | sh<br>
uv pip compile requirements.in -o requirements.txt<br>
# This creates a .venv folder in your current directory<br>
uv venv<br>
uv pip sync requirements.txt<br>
# activate venv<br>
source .venv/bin/activate<br>


