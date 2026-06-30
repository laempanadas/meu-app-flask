from flask import Flask, render_template

app = Flask(__name__)

@app.route('/')
def index():
    # Rota inicial redireciona ou renderiza a política de privacidade como página padrão
    return render_template('privacidade.html')

@app.route('/privacidade')
def privacidade():
    return render_template('privacidade.html')

@app.route('/termos')
def termos():
    return render_template('termos.html')

@app.route('/exclusao')
def exclusao():
    return render_template('exclusao.html')

if __name__ == '__main__':
    app.run(debug=True)