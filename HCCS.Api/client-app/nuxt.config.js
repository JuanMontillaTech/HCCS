/*!

=========================================================
* Nuxt Argon Dashboard PRO - v1.3.0
=========================================================

* Product Page: https://www.creative-tim.com/product/nuxt-argon-dashboard-pro
* Copyright 2019 Creative Tim (https://www.creative-tim.com)

* Coded by www.creative-tim.com and www.binarcode.com

=========================================================

* The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

*/

const pkg = require('./package')
console.log('ENV', process.env.NODE_ENV)

module.exports = {
    router: {
        base: '/',
        linkExactActiveClass: 'active'
    },

    server: {
        port: 3000,
    },

    /*
     ** Headers of the page
     */
    head: {
        title: 'Hermanas de la caridad del cardenal sancha',
        meta: [
            { charset: 'utf-8' },
            { name: 'viewport', content: 'width=device-width, initial-scale=1' },
            { hid: 'description', name: 'description', content: 'Sistema para enviar balances mensuales' }
        ],
        link: [
            { rel: 'icon', type: 'image/png', href: 'favicon.png' },
            { rel: 'stylesheet', href: 'https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700' },
            { rel: 'stylesheet', href: 'https://use.fontawesome.com/releases/v5.6.3/css/all.css', integrity: "sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/", crossorigin: "anonymous" }
        ]
    },

    /*
     ** Customize the progress-bar color
     */
    loading: { color: '#fff' },

    /*
     ** Global CSS
     */
    css: [
        'assets/css/nucleo/css/nucleo.css',
        'assets/sass/argon.scss'
    ],

    /*
     ** Plugins to load before mounting the App
     */
    plugins: [
        '~/plugins/dashboard/dashboard-plugin',
        { src: '~/plugins/dashboard/full-calendar', ssr: false },
        { src: '~/plugins/dashboard/world-map', ssr: false },
    ],

    /*
     ** Nuxt.js modules
     */
    modules: [
        // Doc: https://axios.nuxtjs.org/usage
        '@nuxtjs/axios',
        '@nuxtjs/pwa',
        '@nuxtjs/auth-next'
    ],
    router: {
        middleware: ['auth']
    },
    auth: {
        redirect: {
            login: '/', // redirect user when not connected
            callback: '/auth/signed-in'
        },
        strategies: {
            local: false,
            auth0: {
                domain: 'dev-3t6hnf4e.us.auth0.com',
                clientId: 'p3hZamTkB25qQld5BfK73j5gDYT13qKe'
            }
        }
    },
    /*
     ** Axios module configuration
     */
    axios: {
        // See https://github.com/nuxt-community/axios-module#options
        baseURL: 'https://localhost:44304/api',
    },

    /*
     ** Build configuration
     */
    build: {
        transpile: [
            'vee-validate/dist/rules'
        ],
        /*
         ** You can extend webpack config here
         */
        extend(config, ctx) {

        },
        extractCSS: process.env.NODE_ENV === 'production',
        babel: {
            plugins: [
                [
                    "component",
                    {
                        "libraryName": "element-ui",
                        "styleLibraryName": "theme-chalk"
                    }
                ]
            ]
        }
    }
}