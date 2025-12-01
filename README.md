#### Install uv dependency management system <br>
curl -LsSf https://astral.sh/uv/install.sh | sh<br>
uv pip compile requirements.in -o requirements.txt<br>
#### This creates a .venv folder in your current directory<br>
uv venv<br>
uv pip sync requirements.txt<br>
#### activate venv<br>
source .venv/bin/activate<br>

#### Test the chatbot locally:<br>
export OPENAI_API_KEY=<br>
export NEO4J_URI=<br>
export NEO4J_PASSWORD=<br>
streamlit run app.py<br>

#### Prepare your env for deployment on GCP<br>
Ref: https://docs.cloud.google.com/run/docs/setup<br>
gcloud artifacts repositories create <repo-name> \<br>
        --repository-format=docker \<br>
        --location=<your region> \<br>
        --description="<some desc>" \<br>
        --immutable-tags \<br>
        --async<br>

gcloud auth configure-docker <region>-docker.pkg.dev<br>

#### Build the docker image on Cloud<br>
gcloud builds submit --tag <region>-docker.pkg.dev/<project-id>/<repo-name>/<image-name>:latest<br>

Ref: https://docs.cloud.google.com/run/docs/building/containers<br>

#### Deploy the docker image on Cloud run<br>
https://docs.cloud.google.com/run/docs/quickstarts/deploy-container<br>




