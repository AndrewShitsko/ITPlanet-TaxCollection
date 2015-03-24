<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head lang="ru">
    <title>АИС для торгового сбора</title>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <link href="favicon.ico" rel="icon"/>
    <link href="css/bootstrap.min.css" rel="stylesheet"/>
    <link href="css/bootstrap-datepicker.min.css" rel="stylesheet"/>
    <link href="css/site.min.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<div class="navbar navbar-default navbar-background">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand navbar-color" href="index.jsp">АИС по сбору налогов с малого бизнеса</a>
        </div>
    </div>
</div>
<div class="container">
    <div id="response">

    </div>
    <div class="row">
        <div class="col-md-12">
            <input type="button" value="Добавить платеж" class="add-payment btn btn-success pull-right">
        </div>
    </div>
    <div>
        <ul id="tabs" class="nav nav-tabs nav-justified">
            <li class="active"><a href="#tab1" data-toggle="tab">Платеж 1</a></li>
            <li></li>
            <li></li>
        </ul>
    </div>
    <div class="tab-content">
        <div class="tab-pane fade in active" id="tab1">
            <form id="taxPayerForm1" action="CSVServlet" method="POST">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        Данные плательщика
                    </div>
                    <div class="panel-body">
                        <div class="form-group">
                            <label for="fId_INN" class="control-label">ИНН индивидуального предпринимателя</label>
                            <input type="text" class="form-control" id="fId_INN" name="inn"
                                   placeholder="Введите ИНН" maxlength="12">
                        </div>
                    </div>
                </div>

                <div class="panel panel-primary">
                    <div class="panel-heading">
                        Данные объекта
                    </div>
                    <div class="panel-body">
                        <div class="form-group">
                            <label for="fId_ADRESS" class="control-label">Адрес торгового объекта</label>
                            <input type="text" class="form-control" id="fId_ADRESS" name="address"
                                   placeholder="Введите адрес">
                        </div>
                        <div class="form-group">
                            <label for="fId_AREA" class="control-label">Площадь торгового объекта, кв.м.</label>
                            <input type="text" class="form-control" id="fId_AREA" name="area"
                                   placeholder="Введите площадь, кв.м." maxlength="8">
                        </div>
                    </div>
                </div>

                <div class="panel panel-primary">
                    <div class="panel-heading">
                        Данные платежа
                    </div>
                    <div class="panel-body">
                        <div class="form-group">
                            <label for="fId_SUM" class="control-label">Сумма уплаченного сбора, руб.</label>
                            <input type="text" class="form-control" id="fId_SUM" name="sum"
                                   placeholder="Введите сумму, руб.">
                        </div>
                        <div class="form-group">
                            <label for="fId_PERIOD" class="control-label">Период (квартал), за который произведена
                                оплата</label>
                            <select class="form-control" id="fId_PERIOD" name="period">
                                <option selected disabled hidden>Выберите оплаченный квартал</option>
                            </select>
                            <span class="help-block with-errors"></span>
                        </div>
                        <div id="datepicker" class="form-group">
                            <label for="fId_DATE" class="control-label">Дата осуществления платежа</label>
                            <input type="text" class="form-control" id="fId_DATE" name="date"
                                   placeholder="Укажите дату">
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <div class="form-group">
        <button id="sendBtn" type="submit" class="btn btn-primary" onclick="submitForms()">Отправить</button>
    </div>
</div>
<!--[if lt IE 9]>
<script src="js/respond.min.js"></script>
<![endif]-->
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="//ajax.aspnetcdn.com/ajax/jquery.validate/1.9/jquery.validate.min.js"></script>
<script src="js/bootstrap/bootstrap.min.js"></script>
<script src="js/bootstrap/bootstrap-datepicker.min.js"></script>
<script src="js/main.min.js"></script>

</body>
</html>