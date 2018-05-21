{% extends "Header.tpl.swift" %}
{% block content %}
class {{ module_name }}Presenter: AbstractPresenter, {{ module_name }}InteractorDelegate {
    var interactor: {{ module_name }}Interactor! {
        didSet {
            self.interactor.delegate = self
        }
    }
    var router: {{ module_name }}Router!
    weak var view: {{ module_name }}View!
}
{% endblock %}
