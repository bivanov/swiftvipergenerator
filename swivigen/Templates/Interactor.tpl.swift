{% extends "Header.tpl.swift" %}
{% block content %}
protocol {{ module_name }}InteractorDelegate: class {
    
}

class {{ module_name  }}Interactor {
    public weak var delegate: {{ module_name }}InteractorDelegate?    
}
{% endblock %}
