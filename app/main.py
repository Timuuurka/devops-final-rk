from flask import Flask, jsonify

def create_app():
    app = Flask(__name__)

    @app.get("/health")
    def health():
        return jsonify(status="ok"), 200

    @app.get("/")
    def index():
        return "DevOps Final RK: OK", 200

    return app

app = create_app()

if __name__ == "__main__":
    # для локального запуска без gunicorn (в контейнере мы используем gunicorn)
    app.run(host="0.0.0.0", port=8000)
