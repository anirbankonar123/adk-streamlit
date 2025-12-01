# Use an official Python runtime as a parent image
FROM python:3.12-slim

# Set the working directory in the container
ENV APP_HOME /app

ENV OPENAI_API_KEY=
ENV NEO4J_URI=
ENV NEO4J_PASSWORD=

WORKDIR $APP_HOME


# Copy the Streamlit app code into the container at /app
COPY . ./

RUN pip install --no-cache-dir -r requirements.txt


# Run the Streamlit app when the container launches
ENTRYPOINT ["streamlit", "run", "app.py", "--server.port=8080", "--server.address=0.0.0.0"]
