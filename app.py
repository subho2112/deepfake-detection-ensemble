#This is a demo app to test if gradio is running suucesfully or not
import gradio as gr

def greet(name):
    return f"Hello, {name}! This is the DeepFake detection prototype."

iface = gr.Interface(fn=greet, inputs="text", outputs="text", title="DeepFake Demo")

if __name__ == "__main__":
    iface.launch(share=True)
