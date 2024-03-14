import openai
import os
from openai import OpenAI

client = OpenAI(
    # This is the default and can be omitted
    api_key=os.environ.get("OPENAI_API_KEY"),
)

# The prompt asking for five examples of AWS events
prompt_text = 'Provide five examples of AWS events in JSON format.'

chat_completion = client.chat.completions.create(
    messages=[
        {
            "role": "user",
            "content": prompt_text,
        }
    ],
    model="gpt-3.5-turbo",
)

# Printing the response
print(chat_completion)
