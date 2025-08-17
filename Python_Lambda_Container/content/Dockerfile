FROM public.ecr.aws/lambda/python:3.11

COPY requirements.txt ./ ${LAMBDA_TASK_ROOT}
RUN pip3 install -r requirements.txt

COPY app.py ${LAMBDA_TASK_ROOT}/

CMD ["app.lambda_handler"]

