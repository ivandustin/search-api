from transformers import AutoModel, AutoTokenizer

model_name = "sentence-transformers/LaBSE"
model = AutoModel.from_pretrained(model_name)
tokenizer = AutoTokenizer.from_pretrained(model_name)
