import UIKit


// Задание 1. Создайте перечисление для ошибок.Далее создайте переменную, которая будет хранить в себе какую-либо ошибку (400 или 404 или 500). И при помощи do-catch сделайте обработку ошибок перечисления. Для каждой ошибки должно быть выведено сообщение в консоль.

enum ServerError: Error {
    case badRequest // не авторизован
    case notFound // не найдено
    case internalServerError // внутренняя ошибка сервера
}

var badRequest: Bool = false
var notFound: Bool = true
var internalServerError: Bool = false

do {
    if badRequest {
        throw ServerError.badRequest
    }
    if notFound {
        throw ServerError.notFound
    }
    if internalServerError {
        throw ServerError.internalServerError
    }
} catch ServerError.badRequest {
    print("Ошибка 400. Пользователь не авторизован")
} catch ServerError.notFound {
    print("Ошибка 404. Страница не найдена")
} catch ServerError.internalServerError {
    print ("Ошибка 500. Внутренняя ошибка сервера")
}

// Задание 2. Теперь добавьте проверку переменных в генерирующую функцию и обрабатывайте её!

func foundError() throws {
    if badRequest {
        throw ServerError.badRequest
    }
    if notFound {
        throw ServerError.notFound
    }
    if internalServerError {
        throw ServerError.internalServerError
    }
}

do {
    try foundError()
} catch ServerError.badRequest {
    print("Error 400. User is not authorized")
} catch ServerError.notFound {
    print("Error 404. Page is not found")
} catch ServerError.internalServerError {
    print("Error 500. Internal server error")
}

// Задание 3. Напишите функцию, которая будет принимать на вход два разных типа и проверять: если типы входных значений одинаковые, то вывести сообщение “Yes”, в противном случае — “No”.

func checkType<T, E>(a: T, b: E) {
    if type(of: a) == type(of: b) {
        print("Yes")
    } else {
        print("No")
    }
}

checkType(a: 7, b: 5)
checkType(a: 7, b: "Hello!")

// Задание 4. Реализуйте то же самое, но если тип входных значений различается, выбросите исключение. Если тип одинаковый — тоже выбросите исключение, но оно уже будет говорить о том, что типы одинаковые. Не бойтесь этого. Ошибки — это не всегда про плохой результат.

enum CompareTypeVar: Error {
    case same
    case different
}

func checkTypeTwo<T, E>(a: T, b: E) throws {
    if type(of: a) == type(of: b) {
        throw CompareTypeVar.same
    } else {
        throw CompareTypeVar.different
    }
}

do {
    try checkTypeTwo(a: 7, b: "Hello!")
} catch CompareTypeVar.same {
    print("Типы одинаковые")
} catch CompareTypeVar.different {
    print("Типы разные")
}

do {
    try checkTypeTwo(a: 7, b: 5)
} catch CompareTypeVar.same {
    print("Типы одинаковые")
} catch CompareTypeVar.different {
    print("Типы разные")
}

// Задание 5. Напишите функцию, которая принимает на вход два любых значения и сравнивает их при помощи оператора равенства ==.

func compareVar<T: Equatable>(x: T, y: T) {
    if  x == y {
        print("Значения равны")
    } else {
        print("Значения не равны")
    }
}

compareVar(x: 2, y: 8)
compareVar(x: "Привет", y: "Привет")
