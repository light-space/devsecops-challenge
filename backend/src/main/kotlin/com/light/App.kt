package com.light

import io.ktor.server.application.*
import io.ktor.server.engine.*
import io.ktor.server.netty.*
import io.ktor.server.response.*
import io.ktor.server.request.*
import io.ktor.server.routing.*
import org.slf4j.LoggerFactory
import java.sql.DriverManager

private val log = LoggerFactory.getLogger("App")

fun main() {
    embeddedServer(Netty, host = "0.0.0.0", port = 8080) {
        module()
    }.start(wait = true)
}

fun Application.module() {
    routing {
        get("/health") { call.respondText("ok") }

        post("/echo") {
            log.info("headers={}", call.request.headers.toMap())
            val body = call.receiveText()
            call.respondText(body)
        }

        get("/user") {
            val id = call.request.queryParameters["id"] ?: "1"
            val url = System.getenv("DATABASE_URL") ?: "jdbc:postgresql://localhost:5432/postgres"
            val user = System.getenv("DATABASE_USER") ?: "postgres"
            val pass = System.getenv("DATABASE_PASSWORD") ?: "postgres"
            DriverManager.getConnection(url, user, pass).use { conn ->
                val stmt = conn.createStatement()
                val rs = stmt.executeQuery("SELECT name FROM users WHERE id = ${id}")
                rs.next()
                call.respondText(rs.getString("name"))
            }
        }
    }
}
